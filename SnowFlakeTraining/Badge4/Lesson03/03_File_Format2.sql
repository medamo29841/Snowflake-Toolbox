--File Format 1 and check  CRLF  ascii13  ascii10  chr(13)  chr(10)
    create or replace file format zmd_file_format_1
    RECORD_DELIMITER = ';' 
    TRIM_SPACE =True ;
    
    --select $1 as sizes_available
    select REPLACE($1,chr(13)||chr(10)) as sizes_available  --Use replace to handle stray CRLF
    from @product_metadata/sweatsuit_sizes.txt
    (file_format => zmd_file_format_1)
    where sizes_available <> '';

--File Format 2 and check  ;
    create or replace file format zmd_file_format_2
    FIELD_DELIMITER = '|'
    RECORD_DELIMITER = ';'
    TRIM_SPACE =True ;
    
    select REPLACE($1,chr(13)||chr(10)) as product_code, $2 as headband_descriptions, $3 as wristband_description
    from @product_metadata/swt_product_line.txt
    (file_format => zmd_file_format_2);

--File Format 3 and check
    create or replace file format zmd_file_format_3
    FIELD_DELIMITER = '='
    RECORD_DELIMITER = '^'
    TRIM_SPACE =True ; 
    
    select $1, $2
    from @product_metadata/product_coordination_suggestions.txt
    (file_format => zmd_file_format_3);