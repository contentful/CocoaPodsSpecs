Pod::Spec.new do |s|
  s.name             = "cmark"
  s.version          = "0.22.0"
  s.summary          = "A pedantic Markdown parser, written in C."
  s.homepage         = "https://github.com/jgm/cmark"
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.author           = { "John MacFarlane" => "https://github.com/jgm" }
  s.source           = { :git => "https://github.com/jgm/cmark.git", :tag => s.version }

  s.ios.deployment_target = 6.0
  s.osx.deployment_target = 10.8

  s.requires_arc = true
  s.source_files = 'src/*.c', 'src/*.h'
  s.exclude_files = 'src/main.c'

  s.compiler_flags = '-Wno-shorten-64-to-32'
  s.preserve_path = 'src/case_fold_switch.inc', 'src/entities.inc'
  s.prepare_command = <<-CMD
    cat >src/cmark_export.h <<EOF
#define CMARK_EXPORT __attribute__((visibility("default")))
EOF

    cat >src/cmark_version.h <<EOF
#ifndef CMARK_VERSION_H
#define CMARK_VERSION_H

#define CMARK_VERSION ((0 << 16) | (17 << 8)  | 0)
#define CMARK_VERSION_STRING "0.17.0"

#endif
EOF

    cat >src/config.h <<EOF
#define HAVE_STDBOOL_H

#ifdef HAVE_STDBOOL_H
  #include <stdbool.h>
#elif !defined(__cplusplus)
  typedef char bool;
#endif

#define HAVE___BUILTIN_EXPECT

#define HAVE___ATTRIBUTE__

#ifdef HAVE___ATTRIBUTE__
  #define CMARK_ATTRIBUTE(list) __attribute__ (list)
#else
  #define CMARK_ATTRIBUTE(list)
#endif

#define HAVE_VA_COPY

#ifndef HAVE_VA_COPY
  #define va_copy(dest, src) ((dest) = (src))
#endif

#define CMARK_INLINE inline
EOF

    perl tools/mkcasefold.pl < data/CaseFolding-3.2.0.txt > src/case_fold_switch.inc
    re2c --case-insensitive -bis src/scanners.re > src/scanners.c || (rm src/scanners.c && false)
  CMD
end
