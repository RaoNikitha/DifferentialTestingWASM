;; 3. **Loops and Branching with `nop`:**    - **Description**: Include a loop with `nop` instructions inside and use `br` to jump out of the loop. Verify the loop exits correctly.    - **Constraint Checked**: Validates `nop` handling within loops and correct `br` target resolution.    - **Relation to Incorrect Branch Target Resolution**: Ensures branches out of loops with `nop` inside resolve correctly.

(assert_invalid
  (module
    (func $loop-with-nop (loop (nop) (br 1)))
  )
  "unknown label"
)