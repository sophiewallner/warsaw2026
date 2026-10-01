# for 'abs_path'
use Cwd;
if (@rc_files_read){
    ensure_path( 'TEXINPUTS', "@{[dirname(abs_path($rc_files_read[-1]))]}//" );
}
else {
    ensure_path( 'TEXINPUTS', ".//" );
}
## Handle cleanup of aux files
# add .vrb and .cut files to aux files for cleanup
$clean_ext .= " %R.vrb %R.cut %R.nav %R.snm ";

# options for pdflatex
$pdf_mode = 1;
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error';
# write aux files to their own folder
$aux_dir = ".aux";
$emulate_aux = 1;