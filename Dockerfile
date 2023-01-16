FROM continuumio/anaconda3

RUN conda install jupyter -y --quiet

# Create the different directories
RUN mkdir /opt/notebooks

# Copy the notebooks
COPY ./notebooks /opt/notebooks

# Copy the data
COPY ./data /opt/notebooks/data

WORKDIR /opt/notebooks

# Expose the port
EXPOSE 8888

# Run the jupyter notebook
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]