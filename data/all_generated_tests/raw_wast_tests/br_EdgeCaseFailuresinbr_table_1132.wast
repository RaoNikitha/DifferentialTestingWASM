;; 3. **Negative Index Handling:**    - Introduce a negative index value to the `br_table` instruction. Even though it should not occur in valid WebAssembly, this tests the robustness of the engine against invalid input.    - **Constraint:** Ensures that the implementation correctly rejects or handles negative indices gracefully.

(assert_invalid
  (module
    (func
      (block
        (block
          (br -1)
        )
      )
    )
  )
  "unknown label"
)