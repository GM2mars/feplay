<cart>
  <div class="cart uk-panel uk-panel-box uk-panel-box-primary">
      <div class="uk-badge uk-margin-bottom">Your Cart</div>
      <div class="uk-margin-small-bottom" if={ !products.length }>
        Please add some products to cart.
      </div>
      <div class="uk-margin-small-bottom" each={ products }>
        <div key={ id }>{title} - &euro;{price} x {quantity}</div>
      </div>
      <div class="uk-margin-small-bottom">Total: &euro;{ totalPrice() }</div>
      <button class="uk-button uk-button-large uk-button-success uk-align-right"
        onclick={ checkout } disabled={ products.length == 0}>
        Checkout
      </button>
  </div>

  <script>
  var self = this

  self.products = []

  totalPrice() {
    var totalPrice = 0
    self.products.forEach(function(p) {
      totalPrice += p.price * p.quantity
    })
    return totalPrice.toFixed(2)
  }

  checkout(e) {
    RiotControl.trigger('ve_checkout')
  }

  RiotControl.on('se_cart_changed', function(productsInCart) {
    self.products = Object.keys(productsInCart).map(function(key){
      return productsInCart[key]
    })
    self.update()
  })
  </script>
</cart>
