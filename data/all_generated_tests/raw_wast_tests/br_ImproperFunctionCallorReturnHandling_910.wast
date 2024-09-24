;; 1. Test Description: Create a nested function that contains a `br` instruction which improperly targets a label, skipping a necessary `call_indirect` operation. This tests for handling incorrect function calls when branching.

(assert_invalid
  (module 
    (func $test 
      (block 
        (block 
          (block (call_indirect (type 0))) (br 1)
        ) 
      )
    )
  )
  "unknown type"
)