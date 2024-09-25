{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    loadModels = ["llama3.1:70b"];
  };
}
