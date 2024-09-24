;; 5. **Test: Invalid Function Call Index in Loop**     - Description: Include a `call` instruction within a loop that attempts to call a function with an invalid index. The function should not exist or be out of bounds in the function table.     - Constraint: Ensures the implementation correctly raises an error for invalid function indices within loops.

(assert_invalid
  (module
    (func
      (loop
        (call 999) ;; Invalid function index
      )
    )
  )
  "unknown function"
)