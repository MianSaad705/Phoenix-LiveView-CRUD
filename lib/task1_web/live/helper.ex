defmodule Task1Web.Helper do
  import Phoenix.LiveView
  def validate(data) do
    if(data["name"]== "" or
       data["email"]== "" or
       data["nick_name"]== "" or
       data["identity_mark"]== "") do
               false
      else
               true
      end
      end
end
