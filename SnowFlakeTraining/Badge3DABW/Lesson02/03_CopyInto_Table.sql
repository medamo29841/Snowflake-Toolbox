COPY INTO smoothies.public.fruit_options
from ( Select $2 as FRUIT_ID, $1 as FRUIT_NAME 
from @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt )
file_format = (format_name = smoothies.public.two_headerrow_pct_delim)
on_error = abort_statement
purge = true;