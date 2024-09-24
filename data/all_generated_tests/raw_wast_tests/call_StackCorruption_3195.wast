;; Test Description 4: Provide an invalid `funcidx` (out-of-bounds function index) to a `call` instruction and check if the engines correctly trap the error without corrupting the stack. Ensure that no residual changes occur in the stack after trapping the error.

(assert_invalid
  (module
    (func (result i32)
      (call 1000)
    )
  )
  "unknown function"
)