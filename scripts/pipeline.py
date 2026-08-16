import pandas as pd

def load_data(path):
    return pd.read_csv(path)

def clean_data(df):
    df = df.drop_duplicates()
    df = df.dropna(subset=['Sales'])
    return df

def calculate_kpis(df):
    kpis = {
        'Total Sales': df['Sales'].sum(),
        'Total Orders': df['Order ID'].nunique(),
        'Total Customers': df['Customer ID'].nunique(),
        'Average Sale': df['Sales'].mean()
    }
    return pd.DataFrame([kpis])

def main():
    df = load_data('data/cleaned_superstore.csv')
    df = clean_data(df)
    kpis = calculate_kpis(df)

    df.to_csv('data/processed_superstore.csv', index=False)
    kpis.to_excel('reports/kpi_summary.xlsx', index=False)
    print("Pipeline complete. KPIs exported to reports/kpi_summary.xlsx")

if __name__ == "__main__":
    main()