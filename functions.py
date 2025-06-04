def standardize_column_names(df):
    """
    Standardizes column names in a pandas DataFrame:
    - Strips whitespace
    - Converts to lowercase
    - Replaces non-alphanumeric characters with underscores
    - Removes multiple underscores
    - Removes leading/trailing underscores
    """
    df.columns = (
        df.columns.str.strip()                                 # Remove leading/trailing spaces
                  .str.lower()                                 # Convert to lowercase
                  .str.replace(r'[^\w\s]', '_', regex=True)    # Replace special chars with _
                  .str.replace(r'\s+', '_', regex=True)        # Replace spaces with _
                  .str.replace(r'_+', '_', regex=True)         # Remove multiple underscores
                  .str.strip('_')                              # Remove leading/trailing _
    )
    return df
