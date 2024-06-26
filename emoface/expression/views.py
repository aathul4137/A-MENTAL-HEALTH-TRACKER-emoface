from django.http import HttpResponse
from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
# Create your views here.
from emoface import settings
from keras.preprocessing.image import img_to_array
import imutils
import cv2
from keras.models import load_model
import numpy as np
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
def express(request):
    if request.method=="POST":
        a=request.POST.get('file')
        myfiles=request.FILES['file']
        fs=FileSystemStorage()
        filename=fs.save(myfiles.name,myfiles)

        # import pyttsx3
        # engine = pyttsx3.init()

        # parameters for loading data and images
        detection_model_path = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "haarcascade_frontalface_default.xml"
        emotion_model_path =str(settings.BASE_DIR) + str(settings.STATIC_URL) + "pretrained.hdf5"


        # hyper-parameters for bounding boxes shape
        # loading models
        face_detection = cv2.CascadeClassifier(detection_model_path)
        emotion_classifier = load_model(emotion_model_path, compile=False)
        EMOTIONS = ["angry", "disgust", "scared", "happy", "sad", "surprised",
                    "neutral"]

        dep = ["angry", "disgust", "scared", "sad"]

        # frame = camera.read()[1]
        frame=cv2.imread(str(settings.BASE_DIR) + str(settings.STATIC_URL)+filename)
        # reading the frame
        frame = imutils.resize(frame, width=300)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_detection.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30),
                                                flags=cv2.CASCADE_SCALE_IMAGE)
        label="No face found"
        canvas = np.zeros((250, 300, 3), dtype="uint8")
        frameClone = frame.copy()
        if len(faces) > 0:
            faces = sorted(faces, reverse=True,
                           key=lambda x: (x[2] - x[0]) * (x[3] - x[1]))[0]
            (fX, fY, fW, fH) = faces
            # Extract the ROI of the face from the grayscale image, resize it to a fixed 28x28 pixels, and then prepare
            # the ROI for classification via the CNN
            roi = gray[fY:fY + fH, fX:fX + fW]
            roi = cv2.resize(roi, (64, 64))
            roi = roi.astype("float") / 255.0
            roi = img_to_array(roi)
            roi = np.expand_dims(roi, axis=0)

            preds = emotion_classifier.predict(roi)[0]
            print("predictions")

            emotion_probability = np.max(preds)
            label = EMOTIONS[preds.argmax()]
            print(label)
        return HttpResponse(label)
        # feelings_faces = []
        # for index, emotion in enumerate(EMOTIONS):
        # feelings_faces.append(cv2.imread('emojis/' + emotion + '.png', -1))

        # starting video streaming
        # def process():
        #     cv2.namedWindow('your_face')
        #     camera = cv2.VideoCapture(0)
        #     while True:
        #
                #         #print(type(label))
                #         engine.say(label)
                #         engine.runAndWait()
            #     else:
            #         continue
            #
            #     for (i, (emotion, prob)) in enumerate(zip(EMOTIONS, preds)):
            #         # construct the label text
            #         text = "{}: {:.2f}%".format(emotion, prob * 100)
            #
            #         # draw the label + probability bar on the canvas
            #         # emoji_face = feelings_faces[np.argmax(preds)]
            #
            #         w = int(prob * 300)
            #         cv2.rectangle(canvas, (7, (i * 35) + 5),
            #                       (w, (i * 35) + 35), (0, 0, 255), -1)
            #         cv2.putText(canvas, text, (10, (i * 35) + 23),
            #                     cv2.FONT_HERSHEY_SIMPLEX, 0.45,
            #                     (255, 255, 255), 2)
            #         if label in dep:
            #             label = 'Depressed'
            #         cv2.putText(frameClone, label, (fX, fY - 10),
            #                     cv2.FONT_HERSHEY_SIMPLEX, 0.45, (0, 0, 255), 2)
            #         cv2.rectangle(frameClone, (fX, fY), (fX + fW, fY + fH),
            #                       (0, 0, 255), 2)
            #     #    for c in range(0, 3):
            #     #        frame[200:320, 10:130, c] = emoji_face[:, :, c] * \
            #     #        (emoji_face[:, :, 3] / 255.0) + frame[200:320,
            #     #        10:130, c] * (1.0 - emoji_face[:, :, 3] / 255.0)
            #
            #     cv2.imshow('your_face', frameClone)
            #     cv2.imshow("Probabilities", canvas)
            #     if cv2.waitKey(1) & 0xFF == ord('q'):
            #         break
            #
            # camera.release()
            # cv2.destroyAllWindows()

    return render(request,'expression/expression.html')

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def upimage(request):

    if request.method=="POST":
        mfile=request.FILES['file']
        fs=FileSystemStorage()
        fname=fs.save(mfile.name,mfile)
        return HttpResponse("hello")
    return render(request,'expression/index.html')