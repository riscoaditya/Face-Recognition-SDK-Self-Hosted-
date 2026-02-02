# Models Folder

Place required ONNX models here:

- detector.onnx  (e.g. SCRFD)
- recognizer.onnx (e.g. ArcFace)

Then run:
docker compose up -d

Notes:
- This package does NOT include models.
- Models must match expected input sizes:
  - detector: commonly 640x640
  - recognizer: 112x112
