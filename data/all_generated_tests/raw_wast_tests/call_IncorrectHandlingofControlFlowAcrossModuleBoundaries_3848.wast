;; 7. Test a large number of function calls to an imported function in quick succession to observe how different implementations handle the rapid transitions across module boundaries. Validate that the stack state remains consistent and that proper error messages are generated if any unknown function indices are encountered.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (type (func))))
    (func $testRapidCalls
      (call $externalFunc)
      (call $externalFunc)
      (call $externalFunc)
      (call $externalFunc)
      (call $externalFunc)
      ;; ...include many more calls to $externalFunc if needed to test rapid succession...
      (call $externalFunc) ;; Example placeholder for multiple calls
    )
  )
  "unknown function index"
)