class AdminController < ApplicationController
  protect_from_forgery prepend: true

  layout "admin"
end