FROM ollama/ollama:0.9.0-rc0-rocm
ENV MODELS="llama3.2"
ENV OLLAMA_KEEP_ALIVE=-1
ENV OLLAMA_MAX_LOADED_MODELS=2

COPY entrypoint.sh /

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]