var btnCadastro = function(){
    window.location.href = 'singup.html?' + emailCadastro.value;
}

var receberCadastro = function(){
    var email = window.location.search;
    email = email.replace('?', '')
    userEmail.value = email;
}