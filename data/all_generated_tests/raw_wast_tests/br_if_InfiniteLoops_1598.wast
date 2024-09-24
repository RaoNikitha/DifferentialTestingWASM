;; 9. Design a loop with multiple `br_if` instructions having different conditions, designed to exit under certain stack states. A faulty `wizard_engine` ref handling might lead to infinite loops despite correct conditions.

(assert_invalid
  (module
    (func $loop-with-br_if
      (loop
        (i32.const 1)
        (br_if 1 (i32.const 0))
        (br_if 0) 
      )
    )
  )
  "unreachable code"
)