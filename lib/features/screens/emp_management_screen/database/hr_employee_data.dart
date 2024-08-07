//Employee data

class DataEmployee {
  final String id;
  final String name;
  final String position;
  final String department;
  final String status;

  const DataEmployee({
    required this.id,
    required this.name,
    required this.position,
    required this.department,
    required this.status,
  });
}

List<DataEmployee> employeeData = [
  const DataEmployee(
    id: 'EMP001',
    name: 'John Doe',
    position: 'Software Engineer',
    department: 'Engineering',
    status: 'Probationary',
  ),
  const DataEmployee(
    id: 'EMP002',
    name: 'Jane Smith',
    position: 'Product Manager',
    department: 'Product',
    status: 'Regular',
  ),
  const DataEmployee(
    id: 'EMP003',
    name: 'Michael Lee',
    position: 'UI/UX Designer',
    department: 'Design',
    status: 'Part-Time',
  ),
  const DataEmployee(
    id: 'EMP004',
    name: 'Olivia Jones',
    position: 'Marketing Specialist',
    department: 'Marketing',
    status: 'Intern',
  ),
  const DataEmployee(
    id: 'EMP005',
    name: 'David Garcia',
    position: 'Sales Manager',
    department: 'Sales',
    status: 'Contractual',
  ),
  const DataEmployee(
    id: 'EMP006',
    name: 'Emily Williams',
    position: 'Data Analyst',
    department: 'Data Science',
    status: 'Probationary',
  ),
  const DataEmployee(
    id: 'EMP007',
    name: 'Charles Brown',
    position: 'DevOps Engineer',
    department: 'IT Operations',
    status: 'Regular',
  ),
  const DataEmployee(
    id: 'EMP008',
    name: 'Amanda Miller',
    position: 'Content Writer',
    department: 'Marketing',
    status: 'Part-Time',
  ),
  const DataEmployee(
    id: 'EMP009',
    name: 'Robert Davis',
    position: 'Quality Assurance Engineer',
    department: 'QA',
    status: 'Intern',
  ),
  const DataEmployee(
    id: 'EMP010',
    name: 'Catherine Wilson',
    position: 'Business Analyst',
    department: 'Business Development',
    status: 'Contractual',
  ),
];
