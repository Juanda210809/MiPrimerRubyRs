class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_foto
  end

  def show
    product
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    pp @product

    if @product.save
      
       redirect_to products_path, notice: t('.created') #'Producto creado !!!'
    else
     render :new, status: :unprocessable_entity
    end # Este end era extraño
  end


  def product_params
    params.require(:product).permit(:titulo, :descripcion, :precio, :foto)
  end


  def edit 
   product
  end


  def update
      if product.update(product_params)
        redirect_to products_path, notice: t('.updated') #'Producto Actualizado !!!'
      else
        render :edit, status: :unprocessable_entity
      end
  end

 def destroy 
     product.destroy
     redirect_to products_path, notice: t('.destroyed') #'Producto Eliminado !!!'

 end

def product
  @product = Product.find(params[:id])
end
end