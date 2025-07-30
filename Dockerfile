FROM pandoc/core:3.7.0-ubuntu

ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=UTC

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    gnupg2 \
    inkscape \
    exiftool \
    python3 \
    python3-pip \
    unzip \
    tzdata \
    git && \
    python3 -m pip install pandocfilters==1.5.1 docxcompose==1.4.0 pdf-cli==0.2.0 --break-system-packages && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs=18.18.0-1nodesource1 && \
    npm install -g npm@9.8.1 && \
    npm install -g cloudconvert-cli@2.0.3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    mkdir -p /workspace /workspace/docs

# Set the timezone to UTC
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

WORKDIR /workspace
COPY docs/ /workspace/docs/
COPY Attestations/ /workspace/Attestations/
COPY CBOM/ /workspace/CBOM/
COPY HBOM/ /workspace/HBOM/
COPY MBOM/ /workspace/MBOM/
COPY ML-BOM/ /workspace/ML-BOM/
COPY OBOM/ /workspace/OBOM/
COPY SaaSBOM/ /workspace/SaaSBOM/
COPY SBOM/ /workspace/SBOM/
COPY VDR_VEX/ /workspace/VDR_VEX/
COPY images/ /workspace/images/
COPY templates/ /workspace/templates/
COPY build/gen.sh /workspace/gen.sh
RUN chmod +x /workspace/gen.sh

RUN cd /workspace

ENTRYPOINT ["/workspace/gen.sh"]
