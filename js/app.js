var totalCarrinho = 0;

Cart = function(op, id, preco, categ){
  totalCarrinho = Number(totalCarrinho);
  op == 'sum' ? totalCarrinho += preco : totalCarrinho -= preco;
  totalCarrinho = totalCarrinho.toFixed(2);
  document.getElementById('preco-total').innerHTML = 'R$&nbsp;' + totalCarrinho;
  let preCategoria;

  if(categ == 'alimento'){
    idCateg = 'preco-alimento';
  }else if(categ == 'bebida'){
    idCateg = 'preco-bebida';
  }else if(categ == 'higiene'){
    idCateg = 'preco-higiene';
  }else if(categ == 'limpeza'){
    idCateg = 'preco-limpeza';
  }

  preCategoria = document.getElementById(idCateg).innerHTML;
  preCategoria = preCategoria.replace('R$&nbsp;', '');
  preCategoria = Number(preCategoria);
  op == 'sum' ? preCategoria += preco : preCategoria -= preco;
  preCategoria = preCategoria.toFixed(2);
  document.getElementById(idCateg).innerHTML = 'R$&nbsp;' + preCategoria;
}

var logout = function(){
  let r = confirm('Deseja mesmo sair ?');
  if(r == true){
    window.location.replace("index.html");
  }
}

Vue.component('produto',{
    props: ['item'],
    data: function () {
      return {
        quantidade: 0
      }
    },
    template: `
    <div class="col lg-4 col-md-6 mb-4">
      <div class="card h-100">
          <a><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
              <h4 class="card-title">
                  <a> {{ item.titulo }}</a>
              </h4>
              <h5>R$ {{item.preco}}</h5>
              <p class="card-text"> item.desc </p>
          </div>
          <div class="card-footer">
            <div class="row">
              <div class="col">
                  <button v-on:click="adicionarCarrinho" class="btn btn-block btn-success"> Adicionar </button>
              </div>
              <div class="col">
                  <h4 class="text-center">{{ quantidade }}</h4>
              </div>
              <div class="col">
                <button v-on:click="removerCarrinho" class="btn btn-block btn-danger"> Remover </button>
              </div>
            </div>
          </div>
      </div>
    </div>
    `,
    methods: {
      adicionarCarrinho: function(){
        this.quantidade++;
        Cart('sum', this.item.id, this.item.preco, this.item.categoria );
      },

      removerCarrinho: function(){
        if(this.quantidade > 0){
        Cart('sub', this.item.id, this.item.preco, this.item.categoria );
        this.quantidade--;
        }
      }
    }
  })
  new Vue({
    el: '#lista-de-produtos',
    data: {
      itens: [  {id: 1, titulo: 'Arroz Branco', preco: 5.00, categoria: 'alimento'},
      {id: 2, titulo: 'Feijão Carioca', preco: 10.47 , categoria: 'alimento'},
      {id: 3, titulo: 'Macarrão Tipo A', preco: 5.00 , categoria: 'alimento'},
      {id: 4, titulo: 'Carne Bovina' , preco: 500.00, categoria: 'alimento'},
      {id: 5, titulo: 'Farinha de Trigo' , preco: 15.00, categoria: 'alimento'},
      {id: 6, titulo: 'Coca-Cola 2L' , preco: 4.99, categoria: 'bebida'},
      {id: 7, titulo: 'Sabonete Liquido' , preco: 4.99, categoria: 'higiene'},
      {id: 8, titulo: 'Agua Sanitaria' , preco: 4.99, categoria: 'limpeza'}]
    }
  })