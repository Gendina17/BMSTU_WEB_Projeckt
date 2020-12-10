class MainController < ApplicationController
  def index
    # @persons = [{name:"ИВАН", status: "люблю кефир!!!", group:'ИУ6-32Б'},
    #             {name:"Роман", status: "люблю ряженку!!!", group:'ИУ6-32Б'},
    #             {name:"Сергей", status: "люблю капусту!!!", group:'ИУ6-32Б'},
    #             {name:"Дима", status: "люблю растишку!!!", group:'ИУ6-32Б'},
    #             {name:"Стас", status: "люблю капусту!!!", group:'ИУ6-32Б'},
    #             {name:"Андрей", status: "люблю капусту!!!", group:'ИУ6-32Б'}]
    @photo= "/assets/сердце3.svg"
    @_current = User.find_by_id(session[:current_user_id])
    @persons = User.all.order(:id).reverse_order

  end

  def my_profile
  end

  def profile
  end

end
