module LettersHelper

    def nested_form_conditional(f)
        if @elf
            f.hidden_field :elf_id, value: @elf.id
            content_tag(:h4, "Write a letter to Santa with help from #{@elf.name}!!")
        else
            render partial: "nested_elf", locals: {f: f, e: @elf}
        end
    end

end

