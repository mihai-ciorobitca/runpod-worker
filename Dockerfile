FROM runpod/worker-comfyui:5.4.0-base

# Install custom nodes using comfy-cli
RUN comfy-node-install ComfyUI-Wan-ComfyNodes \
    && comfy-node-install ComfyUI-Impact-Pack

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
