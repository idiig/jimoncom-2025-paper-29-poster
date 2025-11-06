# latexmkrc - Generate SVG using LuaLaTeX

# Force LuaLaTeX even when -pdf is specified
$pdf_mode = 4;  # 4 = lualatex
$postscript_mode = 0;
$dvi_mode = 0;

# LuaLaTeX compilation command
$lualatex = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Override pdflatex to use lualatex instead
$pdflatex = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Set maximum number of compilation runs
$max_repeat = 5;

# Command to convert PDF to SVG (with proper quoting)
$success_cmd = 'pdf2svg %D %R.svg';

# Clean temporary files
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo svg';

# Auto cleanup mode
$cleanup_mode = 0;

# Continuous preview mode
$preview_continuous_mode = 1;
