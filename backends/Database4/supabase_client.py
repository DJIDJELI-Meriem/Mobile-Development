
import supabase

# Supabase connection
SUPABASE_URL = "https://dmsjruguiciyfjmpgwmg.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRtc2pydWd1aWNpeWZqbXBnd21nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5NDIwODQsImV4cCI6MjA1NDUxODA4NH0.YgAxmviqtgsu9RlOYvNuXUZBIBuxTmXzmsXxpPIcv3o"
supabase_client = supabase.create_client(SUPABASE_URL, SUPABASE_KEY)
