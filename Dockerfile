# Use the Jupyter minimal notebook base image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy environment.yml and Linux lock file into the container
COPY environment.yml /home/jovyan/
COPY conda-linux-64.lock /home/jovyan/

# Use mamba (included in the base image) to create environment from the lock file
RUN mamba create --name dsci522-env --file /home/jovyan/conda-linux-64.lock && \
    mamba clean --all -f -y

# Activate this environment by default
ENV PATH="/opt/conda/envs/dsci522-env/bin:$PATH"

# Set the working directory
WORKDIR /home/jovyan/

