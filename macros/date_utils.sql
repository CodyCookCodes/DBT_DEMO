{% macro function1(x) %}

    case when to_timestamp({{ x }}) < current_date then 'PAST' else 'FUTURE' end

{% endmacro %}


{% macro fn_Season(x) %}

    case
        when month(to_timestamp({{ x }})) in (12, 1, 2)
        then 'Winter'
        when month(to_timestamp({{ x }})) in (3, 4, 5)
        then 'Spring'
        when month(to_timestamp({{ x }})) in (6, 7, 8)
        then 'Summer'
        else 'Autumn'
    end

{% endmacro %}
