{% macro margin_percent (rev, purch_cost) %}
    ROUND(SAFE_DIVIDE( ( {{rev}} - {{purch_cost}} ) , {{rev}} ) ,2)
{% endmacro %}