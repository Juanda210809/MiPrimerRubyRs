require'test_helper'

class ProductsControllerTest<ActionDispatch::IntegrationTest
  test 'renderiza la lista de productos' do
    get products_path #PRIMERO TARER LA RUTA DE LA PAGINA ES LO MISMO  /PRODUCTS
    assert_response :success
# revisa que en la pagina se esten mostrando dos productos qu eexisten en products.yml
#
    assert_select '.pro', 2
    
  end

  test'renderiza el detalle de cada producto' do 
    get product_path(products(:one))
    assert_response :success

    assert_select '.titulo','SAMSUMNG'
    assert_select '.descripcion','LALALALLA'
    assert_select '.precio', '1000'
  end

  test 'renderiza un nuevo producto' do 
    get new_product_path
    assert_response :success
    assert_select 'form'

  end

  test 'perimite crear un nuevo producto' do
   post products_path, params:{
    product:{
      titulo: 'Nintentdo 64',
      descripcion: 'le altan los cables',
      precio: 45
    }


  }
assert_redirected_to products_path
assert_equal flash[:notice], 'Producto creado !!!'
  
end

  test ' No perimite crear un nuevo producto con capos vacios' do
   post products_path, params:{
    product:{
      titulo: '',
      descripcion: 'le altan los cables',
      precio: 45
    }


  }
assert_response :unprocessable_entity
  
end

test 'Edita un producto por id' do 
 
  get edit_product_path(products(:one))

  assert_response :success
  assert_select 'form'

end

test 'Hacer edicion del producto' do
  patch product_path(products(:one)), params: {
    product: {
      precio: 9999 
    }
  }

  assert_redirected_to products_path
  assert_equal flash[:notice], 'Producto Actualizado !!!'

end


test 'No es posible Hacer edicion del producto' do
  patch product_path(products(:one)), params: {
    product: {
      precio: nil
    }
  }

  assert_response :unprocessable_entity
end

test 'Elimina productos' do
  assert_difference('Product.count',-1) do
  delete product_path(products(:one))
   end
    assert_redirected_to products_path
  assert_equal flash[:notice], 'Producto Eliminado !!!'
  end

end