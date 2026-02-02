#!/bin/bash

# Convert fonts to base64 and create CSS with data URIs
cat > ../google-fonts.css << 'CSSEOF'
/* Inter */
@font-face {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 300;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

# Add base64 encoded fonts
base64 -w 0 inter-v13-latin-300.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 inter-v13-latin-300.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

@font-face {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 inter-v13-latin-400.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 inter-v13-latin-400.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

@font-face {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 600;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 inter-v13-latin-600.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 inter-v13-latin-600.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

/* JetBrains Mono */
@font-face {
  font-family: 'JetBrains Mono';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 jetbrainsmono-v18-latin-400.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 jetbrainsmono-v18-latin-400.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

/* Roboto Slab */
@font-face {
  font-family: 'Roboto Slab';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 robotoslab-v20-latin-400.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 robotoslab-v20-latin-400.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

/* Montserrat */
@font-face {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 montserrat-v26-latin-400.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 montserrat-v26-latin-400.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}

@font-face {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 700;
  font-display: swap;
  src: url('data:font/woff2;charset=utf-8;base64,CSSEOF

base64 -w 0 montserrat-v26-latin-700.woff2 >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff2'),
       url('data:font/woff;charset=utf-8;base64,CSSEOF

base64 -w 0 montserrat-v26-latin-700.woff >> ../google-fonts.css
cat >> ../google-fonts.css << 'CSSEOF'
') format('woff');
}
CSSEOF

echo "Fonts CSS with data URIs created successfully!"
ls -lh ../google-fonts.css
