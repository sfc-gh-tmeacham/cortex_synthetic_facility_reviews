# Healthcare Facility Reviews Analysis with Snowflake Cortex

## Overview

This Snwoflake notebook demonstrates the use of Snowflake's Cortex Generative AI functions to analyze healthcare facility reviews. It showcases various AI-powered text analysis capabilities including sentiment analysis, text classification, summarization, and translation.

## Key Features

- Creates synthetic healthcare facility reviews using Cortex COMPLETE function
- Analyzes review sentiment using SENTIMENT function
- Generates summaries of reviews with SUMMARIZE function
- Classifies reviews by topic using CLASSIFY_TEXT function
- Translates reviews to other languages using TRANSLATE function
- Provides detailed recommendations based on negative reviews
- Visualizes sentiment analysis results using Streamlit

## Setup Requirements

- Snowflake database and schema for storing tables
- Streamlit for visualization components
- Python packages: pandas, plotly

## Main Components

1. **Data Generation**
   - Creates 1,000 synthetic healthcare facility reviews
   - Uses Zipf distribution to simulate realistic data patterns

2. **Text Analysis**
   - Sentiment scoring (-1 to 1 scale)
   - Topic classification across 9 healthcare-specific categories
   - Review summarization
   - Translation capability

3. **Advanced Analysis**
   - Detailed recommendations for negative reviews
   - Analysis of sentiment patterns by topic
   - Visualization of sentiment distribution
   - Interactive dashboards using Streamlit

4. **Visualization**
   - Positive vs. negative review distribution by topic
   - Average sentiment scores
   - Review count by topic
   - Key metrics and detailed topic analysis

## Usage

1. Set up the Snowflake environment and required Python packages
2. Run the notebook cells sequentially
3. Interact with the Streamlit visualizations to explore the data

## Notes

- Initial setup may take ~5 minutes for synthetic data generation
- Uses `mistral-large2` for initial dataset setup
- Uses `mixtral-8x7b` model for detailed analysis
- Includes custom display functions for better visualization
- Supports interactive filtering and analysis of review data
