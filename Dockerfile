FROM ubuntu:12.04

RUN apt-get -y update && apt-get install -y gcc g++ ocaml make

ADD cil-1.3.7/ /austin/cil-1.3.7
RUN ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a
WORKDIR /austin/cil-1.3.7
RUN ./configure
RUN make

ADD austin-sbst/ /austin/austin-sbst
ENV CILHOME=/austin/cil-1.3.7/
WORKDIR /austin/austin-sbst/build
RUN mkdir -p ../AustinLib/obj
RUN mkdir -p ../AustinLib/extlib/libasmrun
RUN mkdir -p ../AustinLib/extlib/libperfcount
RUN mkdir -p ../AustinLib/extlib/libstr
RUN mkdir -p ../AustinLib/extlib/libunix
RUN make all

WORKDIR /austin/austin-sbst/AustinOcaml
