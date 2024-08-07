<script>
import uploadService from "@/services/upload.service";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import CKEditor from "@ckeditor/ckeditor5-vue";
import { ref, watch } from "vue";
// import { Image, ImageResize } from "ckeditor5";

export default {
    name: "CKEditor",
    props: {
        value: {
            type: String,
            required: true,
        },
    },
    components: {
        ckeditor: CKEditor.component,
    },
    emits: ["update:value"],
    setup(props, { emit }) {
        const editorData = ref(props.value);

        watch(
            () => props.value,
            (value) => {
                editorData.value = value;
            }
        );

        watch(editorData, (editorData) => {
            if (editorData) {
                emit("update:value", editorData);
            }
        });

        function uploader(editor) {
            editor.plugins.get("FileRepository").createUploadAdapter = (
                loader
            ) => {
                return {
                    upload: () => {
                        return new Promise((resolve, reject) => {
                            loader.file.then(async (file) => {
                                try {
                                    if (!file) reject("upload file error");

                                    const response =
                                        await uploadService.uploadFile(file);

                                    if (
                                        !response?.metadata ||
                                        !response?.metadata?.url
                                    )
                                        reject("upload file error");

                                    resolve({
                                        default: response.metadata.url,
                                    });
                                } catch (error) {
                                    console.log(`upload file error`, error);
                                    reject(error);
                                }
                            });
                        });
                    },
                };
            };
        }

        return {
            editor: ClassicEditor,
            editorData,
            editorConfig: {
                extraPlugins: [uploader],
                // plugins: [Image, ImageResize],
                image: {
                    toolbar: [
                        "toggleImageCaption",
                        "imageTextAlternative",
                        "ckboxImageEdit",
                    ],
                },
            },
        };
    },
};
</script>


<template>
    <ckeditor
        :editor="editor"
        v-model="editorData"
        :config="editorConfig"
    ></ckeditor>
</template>
