function clean() {
	savedmd4 = "";
	savedmd5 = "";
	savedsha = "";
	hashoutput.text = "";                   
	hashoutput_label.text = "Hashed output:";
}

function MD4Hash() {
	hashmode = "MD4";
	hashoutput_label.text = "Hashed output (MD4):";
	hashoutput.text = "";
	if (savedmd4 == "") {
		if (pickermode == false){
			hashCalculateMd4.calculateHash(hashinput.text);
		}
		else {
			if (picker.selectedFile == ""){
				return;
			}
			else {
				hashCalculateMd4.calculateFileHash(picker.selectedFile);
			}
		}
		savedmd4 = hashCalculateMd4.getHash();
		hashoutput.text = savedmd4;
	}
	else {
		hashoutput.text = savedmd4;
	}
}

function SHA1Hash() {
	hashmode = "SHA1";
	hashoutput_label.text = "Hashed output (SHA-1):";
	hashoutput.text = "";
	if (savedsha == "") {
		if (pickermode == false){
			hashCalculateSha.calculateHash(hashinput.text);
		}
		else {
			if (picker.selectedFile == ""){
				return;
			}
			else {
				hashCalculateSha.calculateFileHash(picker.selectedFile);
			}
		}
		savedsha = hashCalculateSha.getHash();
		hashoutput.text = savedsha;
	}
	else {
		hashoutput.text = savedsha;
	}
}

function MD5Hash() {
	hashmode = "MD5";
	hashoutput_label.text = "Hashed output (MD5):";
	hashoutput.text = "";
	if (savedmd5 == "") {
		if (pickermode == false){
			hashCalculateMd5.calculateHash(hashinput.text);
		}
		else {
			if (picker.selectedFile == ""){
				return;
			}
			else {
				hashCalculateMd5.calculateFileHash(picker.selectedFile);
			}
		}
		savedmd5 = hashCalculateMd5.getHash();
		hashoutput.text = savedmd5;
	}
	else {
		hashoutput.text = savedmd5;
	}
}