# Container image
FROM ubuntu:18.04

# Set working directory
ENV SOFT="/soft"
WORKDIR $SOFT

# Install requirements
RUN apt-get update && apt-get -y upgrade && \
        apt-get install -y build-essential wget pkg-config \
                libncurses5-dev \
                zlib1g-dev \
                libbz2-dev \
                liblzma-dev \
                libcurl4-gnutls-dev \
                libssl-dev \
                libtool \
                m4 \
                automake && \
        apt-get clean && apt-get purge && \
        wget https://github.com/ebiggers/libdeflate/archive/v1.7.tar.gz -O libdeflate_v1.7.tar.gz && \
        tar xvzf libdeflate_v1.7.tar.gz && \
        rm libdeflate_v1.7.tar.gz && \
        cd libdeflate-1.7 && \
        make && \
        make install && \
        cp /usr/local/lib/libdeflate* /lib/ && \
        cd ..
        
# install samtools v1.12 17.03.2021
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
        tar jxf samtools-1.12.tar.bz2 && \
        rm samtools-1.12.tar.bz2 && \
        cd samtools-1.12/ && \
        ./configure --with-libdeflate && \
        make && \
        make install && \
        cd ..

# Install biobambam2 v2.0.087 01.03.2018
RUN wget https://github.com/gt1/biobambam2/releases/download/2.0.87-release-20180301132713/biobambam2-2.0.87-release-20180301132713-x86_64-etch-linux-gnu.tar.gz && \
        tar xvzf biobambam2-2.0.87-release-20180301132713-x86_64-etch-linux-gnu.tar.gz && \
        rm biobambam2-2.0.87-release-20180301132713-x86_64-etch-linux-gnu.tar.gz && \
        mkdir /soft/biobambam2_v2.0.87 && \
        mv /soft/biobambam2/2.0.87-release-20180301132713/x86_64-etch-linux-gnu/* /soft/biobambam2_v2.0.87/ && \
        rm -r /soft/biobambam2 && \
        cd ..

# Assigning variables and adding programs paths to $PATH
ENV SAMTOOLS="/soft/samtools-1.12/samtools"
ENV PATH="/soft/biobambam2_v2.0.87/bin:/soft/biobambam2_v2.0.87/lib:/soft/samtools-1.12:${PATH}"



