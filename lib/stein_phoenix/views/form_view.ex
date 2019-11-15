defmodule Stein.Phoenix.Views.FormView do
  @moduledoc """
  Helper functions for generating bootstrap forms
  """

  use Phoenix.HTML

  @doc """
  Label helper to optionally override the label text
  """
  def field_label(form, field, opts) do
    case Keyword.get(opts, :label) do
      nil ->
        label(form, field, class: "col-md-3")

      text ->
        label(form, field, text, class: "col-md-3")
    end
  end

  @doc """
  Generate a text field, styled properly
  """
  def text_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)
    text_opts = Keyword.take(opts, [:type, :value, :autofocus])

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            text_input(
              form,
              field,
              Keyword.merge([class: form_control_classes(form, field)], text_opts)
            ),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  @doc """
  Generate a text field, styled properly
  """
  def password_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)
    text_opts = Keyword.take(opts, [:value, :rows])

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            password_input(
              form,
              field,
              Keyword.merge([class: form_control_classes(form, field)], text_opts)
            ),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  @doc """
  Generate a number field, styled properly
  """
  def number_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)
    number_opts = Keyword.take(opts, [:placeholder, :min, :max])

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            number_input(
              form,
              field,
              Keyword.merge([class: form_control_classes(form, field)], number_opts)
            ),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  @doc """
  Generate a textarea field, styled properly
  """
  def textarea_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)
    textarea_opts = Keyword.take(opts, [:value, :rows])

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            textarea(
              form,
              field,
              Keyword.merge([class: form_control_classes(form, field)], textarea_opts)
            ),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  @doc """
  Generate a checkbox field, styled properly
  """
  def checkbox_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)

    content_tag(:div, class: "form-group form-check row") do
      content_tag(:div, class: "col-md-9 offset-md-3") do
        [
          label(form, field) do
            [checkbox(form, field, class: "form-check-input"), " ", opts[:label]]
          end,
          error_tag(form, field),
          Keyword.get(opts, :do, "")
        ]
      end
    end
  end

  @doc """
  Generate a file field, styled properly
  """
  def file_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            file_input(form, field, class: form_control_classes(form, field)),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  @doc """
  Generate a select field, styled properly
  """
  def select_field(form, field, opts \\ [], dopts \\ []) do
    opts = Keyword.merge(opts, dopts)
    select_opts = Keyword.take(opts, [:prompt])

    content_tag(:div, class: "form-group row") do
      [
        field_label(form, field, opts),
        content_tag(:div, class: "col-md-9") do
          [
            select(
              form,
              field,
              opts[:options],
              Keyword.merge([class: form_control_classes(form, field)], select_opts)
            ),
            error_tag(form, field),
            Keyword.get(opts, :do, "")
          ]
        end
      ]
    end
  end

  def submit_button(text, dopts \\ []) do
    content_tag(:div, class: "form-group row") do
      content_tag(:div, class: "col-md-9 offset-md-3") do
        [
          submit(text, class: "btn btn-primary"),
          Keyword.get(dopts, :do, "")
        ]
      end
    end
  end

  defp form_control_classes(form, field) do
    case Keyword.has_key?(form.errors, field) do
      true ->
        "form-control is-invalid"

      false ->
        "form-control"
    end
  end

  @doc false
  def error_tag(form, field) do
    error_helpers = Application.get_env(:stein_phoenix, :views)[:error_helpers]
    error_helpers.error_tag(form, field)
  end
end
