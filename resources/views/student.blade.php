<!DOCTYPE html>
<html>
<head>
    <title>Student Result</title>
</head>
<body>
    <h1>{{ $student->name }}</h1>
    <p>Admission No: {{ $student->admission_no }}</p>

    <h3>Results:</h3>
    <ul>
        @foreach($student->results as $result)
            <li>{{ $result->subject->name }}: {{ $result->score }}%</li>
        @endforeach
    </ul>

    <p><strong>Average:</strong> {{ $student->results->avg('score') }}%</p>
</body>
</html>