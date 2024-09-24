;; 6. Create a recursive function in one module that calls an imported function before calling itself again. Test if the error handling for function indices is performed correctly, especially during the recursive transitions between the host and imported modules, avoiding stack overflow and control flow issues.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32)))
    (func $recursiveFunc (param i32)
      (call $externalFunc (local.get 0))
      (call $recursiveFunc (local.get 0))
    )
    (export "recursiveFunc" (func $recursiveFunc))
    (start $recursiveFunc)
  )
  "stack overflow or control flow issue"
)