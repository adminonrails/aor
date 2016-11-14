<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < Admin::BaseController
  before_action :set_<%= singular_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    @q = <%= singular_name.camelize %>.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @<%= plural_name %> = @q.result.page(params[:page])
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_name %> = <%= orm_class.build(singular_name.camelize) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    @<%= singular_name %> = <%= orm_class.build(singular_name.camelize, "#{singular_name}_params") %>

    if @<%= orm_instance(singular_name).save %>
      redirect_to [:admin, @<%= singular_name %>], notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance(singular_name).update("#{singular_name}_params") %>
      redirect_to [:admin, @<%= singular_name %>], notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance(singular_name).destroy %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_name %>
      @<%= singular_name %> = <%= orm_class.find(singular_name.camelize, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_name %>, {})
      <%- else -%>
      params.require(:<%= singular_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq)
    end
end
<% end -%>
