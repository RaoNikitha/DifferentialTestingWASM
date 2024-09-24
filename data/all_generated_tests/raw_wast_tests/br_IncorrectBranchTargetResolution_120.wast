;; 1. Create a test with three nested `block` instructions and insert a `br` instruction targeting the middle block (`label 1`). Check if the implementation correctly unwinds the stack to the middle block and resumes execution after the middle block’s `end` instruction.

(assert_invalid
  (module
    (func $nested-br-test (result i32)
      (block
        (block
          (br 1) 
        )
        (unreachable)
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)