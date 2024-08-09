FROM curlimages/curl:8.9.1 as builder

WORKDIR /download

RUN case "$(uname -m)" in \
        aarch64) export DL_ARCH="linux-arm64" ;; \
        x86_64) export DL_ARCH="linux-x64" ;; \
    esac; \
    curl https://www.nuget.org/api/v2/package/runtime.$DL_ARCH.Microsoft.NETCore.ILDAsm/7.0.0 -L -o ildasm.zip && \
    unzip ildasm.zip runtimes/$DL_ARCH/native/ildasm && \
    mv runtimes/$DL_ARCH/native/ildasm . && \
    curl https://www.nuget.org/api/v2/package/runtime.$DL_ARCH.Microsoft.NETCore.ILAsm/7.0.0 -L -o ilasm.zip && \
    unzip ilasm.zip runtimes/$DL_ARCH/native/ilasm && \
    mv runtimes/$DL_ARCH/native/ilasm .

FROM ghcr.io/linuxserver/emby:beta-4.9.0.29-ls313

WORKDIR /patch/tmp

ADD patch/emby.crt /patch
COPY --from=builder /download/ilasm /patch/
COPY --from=builder /download/ildasm /patch/

RUN chmod +x /patch/ilasm && \
  chmod +x /patch/ildasm && \
  /patch/ildasm /app/emby/Emby.Web.dll -out=Emby.Web.dll && \
  sed -i 's#ajax({url:"https://mb3admin.com/admin/service/registration/validateDevice?"+paramsToString(params),type:"POST",dataType:"json"})#Promise.resolve(new Response('"'"'{"cacheExpirationDays":365,"message":"Device Valid","resultCode":"GOOD"}'"'"').json())#g' Emby.Web.dashboard_ui.modules.emby_apiclient.connectionmanager.js && \
  /patch/ilasm -dll Emby.Web.dll -out=/app/emby/Emby.Web.dll && \
  cat /patch/emby.crt >> /app/emby/etc/ssl/certs/ca-certificates.crt && \
  rm -rf /patch
