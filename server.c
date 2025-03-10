#include <microhttpd.h>
#include <stdio.h>

#define PORT 8080

static int answer_to_request(void *cls, struct MHD_Connection *connection,
                             const char *url, const char *method,
                             const char *version, const char *upload_data,
                             size_t *upload_data_size, void **con_cls) {
    const char *response_str = "Hello, World!";
    struct MHD_Response *response;
    int ret;

    response = MHD_create_response_from_buffer(strlen(response_str), (void*) response_str, MHD_RESPMEM_PERSISTENT);
    ret = MHD_queue_response(connection, MHD_HTTP_OK, response);
    MHD_destroy_response(response);

    return ret;
}

int main() {
    struct MHD_Daemon *daemon;

    daemon = MHD_start_daemon(MHD_USE_THREAD_PER_CONNECTION, PORT, NULL, NULL, &answer_to_request, NULL,
                              MHD_OPTION_END);
    if (NULL == daemon) {
        return 1;
    }

    printf("Server running at http://localhost:8080/\n");
    getchar();
    MHD_stop_daemon(daemon);

    return 0;
}
