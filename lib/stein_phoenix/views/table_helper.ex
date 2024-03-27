defmodule Stein.Phoenix.Views.TableHelper do
  @moduledoc """
  Helper functions to create Bootstrap 4 tables

      <%= table do %>
        <%= header ["Name", "Email", "Actions"]

        <%= body %>
          <%= Enum.map(@users, fn user -> %>
            <%= row do %>
              <%= column do: user.name %>
              <%= column do: user.email %>
              <%= column do %>
                <%= link("View", to: Routes.user_path(@conn, :show, @user.id)) %>
              <% end %>
            <% end %>
          <% end %>
        <% end %>
      <% end %>
  """

  alias PhoenixHTMLHelpers.Tag

  @doc """
  Top level wrapper for a table

  Creates a bordered and responsive table.
  """
  def table(do: block) do
    Tag.content_tag :div, class: "table-responsive" do
      Tag.content_tag :table, class: "table table-bordered" do
        block
      end
    end
  end

  @doc """
    Creates the table head and a header row

        <%= header ["Name", "Email", "Actions"] %>
  """
  def header(columns) do
    Tag.content_tag :thead do
      Tag.content_tag :tr do
        Enum.map(columns, fn column ->
          Tag.content_tag(:th, column)
        end)
      end
    end
  end

  @doc """
  Creates the table body tag
  """
  def body(do: block) do
    Tag.content_tag :tbody do
      block
    end
  end

  @doc """
  Creates a table row tag

      <%= row do %>
        <%= column do: @user.name %>
      <% end %>
  """
  def row(do: block) do
    Tag.content_tag :tr do
      block
    end
  end

  @doc """
  Create a column tag

  Aligns vertically in the row

      <%= column do: @user.name %>
  """
  def column(do: block) do
    Tag.content_tag :td, class: "align-middle" do
      block
    end
  end
end
