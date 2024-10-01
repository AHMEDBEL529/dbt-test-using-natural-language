{% macro get_results(model_name) %}
    {% set sql_query %}
        SELECT * FROM {{ ref(model_name) }}
    {% endset %}
    
    {% set results = run_query(sql_query) %}
    
    {% if results is not none %}
        {% do log('Query executed successfully', info=true) %}
        {{ return(results) }}
    {% else %}
        {% do log('Query returned no results', info=true) %}
    {% endif %}
{% endmacro %}
