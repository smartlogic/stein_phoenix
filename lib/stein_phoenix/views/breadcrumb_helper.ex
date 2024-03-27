defmodule Stein.Phoenix.Views.BreadcrumbHelper do
  @moduledoc """
  Helper functions for Bootstrap 4 breadcrumbs

      <%= breadcrumbs do %>
        <%= breadcrumb do: link("Dashboard", to: Routes.dashboard_path(@conn, :index)) %>
        <%= breadcrumb do: link("Users", to: Routes.user_path(@conn, :index)) %>
        <%= breadcrumb @user.name, active: true %>
      <% end %>
  """

  alias PhoenixHTMLHelpers.Tag

  @doc """
  Wrapper for `breadcrumb/1` and `breadcrumb/2`

  Sets up the base `nav` and `ol`

      <%= breadcrumbs do %>
      <% end %>
  """
  def breadcrumbs(do: block) do
    Tag.content_tag :nav do
      Tag.content_tag :ol, class: "breadcrumb mt-3" do
        block
      end
    end
  end

  @doc """
  Create a breadcrumb link

  You can use two versions of this. One with a `do` block and the other with a plain string.

  Using a string:

      <%= breadcrumb "Users" %>

  Using a `do` block:

      <%= breadcrumb do: link("Users", to: Routes.user_path(@conn, :index)) %>

  No options can be passed along if you use the `do` form.
  """
  def breadcrumb(opts) when is_list(opts) do
    breadcrumb(Keyword.get(opts, :do), [])
  end

  def breadcrumb(name), do: breadcrumb(name, [])

  @doc """
  Create a breadcrumb

  When using this form, you can pass in `active: true` to flag the
  breadcrumb as the active one.

      <%= breadcrumb "Users", active: true %>
  """
  def breadcrumb(name, opts) do
    Tag.content_tag :li, class: breadcrumb_classes(opts) do
      name
    end
  end

  @doc false
  def breadcrumb_classes(opts) do
    case Keyword.get(opts, :active, false) do
      true ->
        "breadcrumb-item active"

      false ->
        "breadcrumb-item"
    end
  end
end
