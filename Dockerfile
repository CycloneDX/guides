# OWASP CycloneDX guide builder
#   markdown (GFM) --pandoc--> HTML --WeasyPrint--> PDF (pypdf assembles
#   cover/body/back and stamps the background art)

FROM python:3.13-slim

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC \
    PYTHON=python3

ARG PANDOC_VERSION=3.8.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      ca-certificates \
      libpango-1.0-0 \
      libpangoft2-1.0-0 \
      libharfbuzz-subset0 \
      fonts-noto-cjk \
      tzdata && \
    arch="$(dpkg --print-architecture)" && \
    curl -fsSL -o /tmp/pandoc.deb \
      "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-${arch}.deb" && \
    dpkg -i /tmp/pandoc.deb && \
    rm /tmp/pandoc.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY templates/pdf/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /workspace
COPY Attestations/ /workspace/Attestations/
COPY CBOM/ /workspace/CBOM/
COPY Design-Assurance/ /workspace/Design-Assurance/
COPY HBOM/ /workspace/HBOM/
COPY MBOM/ /workspace/MBOM/
COPY ML-BOM/ /workspace/ML-BOM/
COPY OBOM/ /workspace/OBOM/
COPY SaaSBOM/ /workspace/SaaSBOM/
COPY SBOM/ /workspace/SBOM/
COPY VDR_VEX/ /workspace/VDR_VEX/
COPY images/ /workspace/images/
COPY templates/ /workspace/templates/
COPY build/build-pdf.sh /workspace/build/build-pdf.sh
RUN chmod +x /workspace/build/build-pdf.sh && mkdir -p /workspace/docs

ENTRYPOINT ["/workspace/build/build-pdf.sh"]
