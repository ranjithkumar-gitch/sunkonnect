class Ticket {
  final String id;
  final String title;
  late final String status;
  final String priority;
  final String assignedTo;
  final String raisedBy;
  late final String message;
  final List<String> attachments;
  final String dateTime;
  final String category;
  final String daysOpen;

  Ticket({
    required this.id,
    required this.title,
    required this.status,
    required this.priority,
    required this.assignedTo,
    required this.raisedBy,
    required this.message,
    required this.attachments,
    required this.dateTime,
    required this.category,
    required this.daysOpen,
  });
}

List<Ticket> myTickets = [
  Ticket(
      id: 'TICK-409',
      dateTime: '2024-02-19 09:00',
      status: 'New',
      assignedTo: 'ranjith',
      priority: 'High',
      message: 'This is a sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "3",
      title: 'Dropdown issue in dashboard'),
  Ticket(
      id: 'TICK-410',
      dateTime: '2024-02-18 10:30',
      status: 'Assigned',
      assignedTo: 'Uday',
      priority: 'Low',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "2",
      title: 'Dropdown issue in dashboard'),
  Ticket(
      id: 'TICK-411',
      dateTime: '2024-02-18 10:30',
      status: 'Acknowledged',
      assignedTo: 'Kumar',
      priority: 'Medium',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "3",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-412',
      dateTime: '2024-02-18 10:30',
      status: 'In process',
      assignedTo: 'Kumar',
      priority: 'Medium',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "1",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-413',
      dateTime: '2024-02-18 10:30',
      status: 'Completed',
      assignedTo: 'Kumar',
      priority: 'High',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "4",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-414',
      dateTime: '2024-02-18 10:30',
      status: 'On Hold',
      assignedTo: 'Kumar',
      priority: 'High',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "4",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-415',
      dateTime: '2024-02-18 10:30',
      status: 'Closed',
      assignedTo: 'Kumar',
      priority: 'High',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "4",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-416',
      dateTime: '2024-02-18 10:30',
      status: 'Cancelled',
      assignedTo: 'Kumar',
      priority: 'High',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      daysOpen: "4",
      category: "Enclosure MOD- shop Package",
      title: 'Dropdown issue in dashboard.'),
  // Add more tickets as needed
];

List<Ticket> allTickets = [
  Ticket(
      id: 'TICK-410',
      dateTime: '2024-02-18 10:30',
      status: 'Assigned',
      assignedTo: 'Uday',
      priority: 'High',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "1",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-411',
      dateTime: '2024-02-18 10:30',
      status: 'Acknowledged',
      assignedTo: 'Kumar',
      priority: 'Medium',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "2",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-411',
      dateTime: '2024-02-18 10:30',
      status: 'In process',
      assignedTo: 'Kumar',
      priority: 'Medium',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "3",
      title: 'Dropdown issue in dashboard.'),
  Ticket(
      id: 'TICK-411',
      dateTime: '2024-02-18 10:30',
      status: 'Completed',
      assignedTo: 'Kumar',
      priority: 'Medium',
      message: 'Another sample ticket for demonstration purposes.',
      attachments: [],
      raisedBy: 'Ranjith',
      category: "Enclosure MOD- shop Package",
      daysOpen: "5",
      title: 'Dropdown issue in dashboard.'),
  // Add more tickets as needed
];
