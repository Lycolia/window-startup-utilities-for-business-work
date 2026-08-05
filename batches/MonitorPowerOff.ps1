[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$form = new-object System.Windows.Forms.Form
$message = [System.Windows.Forms.Message]::Create($form.Handle, 274, 61808, 2)
$nativeWindow = new-object System.Windows.Forms.NativeWindow
$nativeWindow.DefWndProc([ref]$message)
