;; 2. **Misaligned Branch Targets in Nested Loops**:    - Create nested loops where a branch instruction (e.g., `br` or `br_table`) points to an incorrect label index. The CFG would incorrectly represent the target addresses, causing misalignment in branch destinations.

(assert_invalid
  (module (func (block (block (loop (br 2))))))
  "unknown label"
)